var inquirer = require('inquirer');
var mysql = require('mysql');
var Table = require('cli-table');

var amountOwed;
var currentDepartment;
var updateSales;

var connection = mysql.createConnection({
	host: 'localhost',
	port: 3306,
	user: 'root',
	password: 'Keroka96',
	database: 'Bamazon_db'
});

//Establish Connection
connection.connect(function (err) {
	if (err) throw err;
	console.log('connected as id: ' + connection.threadId)
});

//FUNCTIONS
//=============================================================================

//Displays all items available in store and then calls the place order function
function fetchInventory() {
	connection.query('SELECT * FROM products', function (err, res) {
		if (err) throw err;
		console.log('Ndogogio Stores your Home Store!!!');


		for (i = 0; i < res.length; i++) {
			console.log('Item ID:' + res[i].id + ' Product Name: ' + res[i].ProductName + ' Price: ' + '$' + res[i].Price + '(Quantity left: ' + res[i].StockQuantity + ')')
		}
		console.log('=================================================');
		customerPrompt();
	})
}

//Prompts the user to place an order, fulfills the order, and then calls the new order function
function customerPrompt() {
	inquirer.prompt([{
		name: 'selectId',
		message: 'Please enter the ID of the product you wish to purchase',
		validate: function (value) {
			var valid = value.match(/^[0-9]+$/)
			if (valid) {
				return true
			}
			return 'Please enter a numerical value'
		}
	}, {
		name: 'specify_quantity',
		message: 'what would be the quantity of your order?',
		validate: function (value) {
			var valid = value.match(/^[0-9]+$/)
			if (valid) {
				return true
			}
			return 'Please enter a numerical value'
		}
	}]).then(function (customer) {
		connection.query('SELECT * FROM products WHERE id = ?', [customer.selectId], function (err, res) {
		//If stock level is lower than amt cust wants to purchase...print out Insufficient quantity
			if (customer.specify_quantity > res[0].StockQuantity) {
				console.log('Insufficient quantity! Consider a different item or quantity Quantity');
				console.log('This order has been cancelled');
				//doPurchase will take customer to a prompt that asks them to do a different order 
				console.log('');
				doPurchase();
			}
			else {
				amountOwed = res[0].Price * customer.specify_quantity;
				currentDepartment = res[0].DepartmentName;
				console.log('Thanks for your order');
				console.log('\nYour Total today was =$' + amountOwed);
				console.log('');
				//update products table
				connection.query('UPDATE products SET ? Where ?', [{
					StockQuantity: res[0].StockQuantity - customer.specify_quantity
				}, {
					id: customer.selectId
				}], function (err, res) { });
				//update departments table
				logSaleToDepartment();
				doPurchase();
			}
		})

	}, function (err, res) { })
};

//Allows the user to place a new order or end the connection
function doPurchase() {
	inquirer.prompt([{
		type: 'confirm',
		name: 'choice',
		message: 'Would you like to place another order?'
	}]).then(function (customer) {
		if (customer.choice) {
			customerPrompt();
		}
		else {
			console.log('Thank you for shopping at Ndogogio Bamazon!');
			connection.end();
		}
	})
};


//functions to push the sales to the executive table
function logSaleToDepartment() {
	connection.query('SELECT * FROM departments WHERE DepartmentName = ?', [currentDepartment], function (err, res) {
		updateSales = res[0].TotalSales + amountOwed;
		updateDepartmentTable();
	})
};

function updateDepartmentTable() {
	connection.query('UPDATE departments SET ? WHERE ?', [{
		TotalSales: updateSales
	}, {
		DepartmentName: currentDepartment
	}], function (err, res) { });
};
//Call the original function (all other functions are called within this function)
//======================================================================
fetchInventory();