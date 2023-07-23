import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget Tracker'),
      ),
      body: Column(
        children: [
          // User information (You can add user details here)
          SizedBox(height: 20),
          Text('User Name', style: TextStyle(fontSize: 24)),
          SizedBox(height: 10),
          // Expense Total (You can add expense total here)
          Text('Total Expenses: \$500', style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          // List of categories
          ListTile(
            leading: Icon(Icons.category),
            title: Text('Category 1'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExpenseScreen(category: 'Category 1'),
                ),
              );
            },
          ),
          // Add more categories as required
        ],
      ),
    );
  }
}
class ExpenseScreen extends StatelessWidget {
  final String category;

  ExpenseScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses - $category'),
      ),
      body: ListView.builder(
        itemCount: 5, // Replace with the actual number of expenses for this category
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Expense ${index + 1}'),
            subtitle: Text('\$50'), // Replace with the actual expense amount
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddExpenseScreen(),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddExpenseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add New Expense',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(labelText: 'Expense Amount'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(labelText: 'Description'),
            maxLines: 3,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Implement the logic to add the expense
              Navigator.pop(context);
            },
            child: Text('Add Expense'),
          ),
        ],
      ),
    );
  }
}
