import 'dart:io';

void main(List<String> arguments) {
  List<String> grocerysItems = [];
  // i do (while (true ) to to keep the application running until the user chooses to exit.)
  while (true) {
    print(' ***Grocery List Manager***');
    print('1- Add Item');
    print('2- Remove Item');
    print('3- View List');
    print('4-Search for Item ');
    print('5-Exit');

    print('Please enter your choice:');
    String? input = stdin.readLineSync();
    int? choice = int.tryParse(input ?? '');

    if (choice == null) {
      print('Invalid input. Please enter a valid number.');
      continue;
    }

    switch (choice) {
      case 1:
        print('Enter item to add: ');

        String? itemToAdd = stdin.readLineSync();
        if (itemToAdd != null && itemToAdd.isNotEmpty) {
          addItem(grocerysItems, itemToAdd);
          print('now your list is ');
          displayList(grocerysItems, 'none');
        } else {
          print('Invalid input. Item cannot be empty.');
        }
        break;

      case 2:
        print('Enter item to remove: ');
        String? itemToRemove = stdin.readLineSync();
        if (itemToRemove != null && itemToRemove.isNotEmpty) {
          removeItem(grocerysItems, itemToRemove);
          print('now your list has ');
          displayList(grocerysItems, 'none');
        } else {
          print('Invalid input. Item cannot be empty.');
        }
        break;

      case 3:
        print('Enter the format (uppercase, lowercase, or none): ');
        String? format = stdin.readLineSync();
        print('your list has ');
        displayList(grocerysItems, format);
        break;

      case 4:
        stdout.write('Enter item to search for: ');
        String? itemToSearch = stdin.readLineSync();
        searchItem(grocerysItems, itemToSearch);
        break;

      case 5:
        print('Exiting!\n Thank you!');
        return;

      default:
        print('Invalid choice. Please try again.');
    }
  }
}
// Adds a new item to the grocery list and prints a success message.

bool addItem(List<String> grocerysItems, String itemToAdd) {
  grocerysItems.add(itemToAdd);
  print('$itemToAdd added successfully.');
  return true;
}
// Removes an item from the grocery list if it exists and prints a corresponding message.
// If the list is empty, it informs the user that no items can be removed.

bool removeItem(List<String> grocerysItems, String itemToRemove) {
  if (grocerysItems.isEmpty) {
    print('The list is already empty.');
    return false;
  }

  bool removed = grocerysItems.remove(itemToRemove);
  if (removed) {
    print('$itemToRemove removed successfully.');
  } else {
    print('$itemToRemove not found in the list.');
  }
  return removed;
}

// Displays the grocery list, optionally formatting the items in uppercase, lowercase, or as-is.

void displayList(List<String> grocerysItems, String? format) {
  if (grocerysItems.isEmpty) {
    print('The list is empty.');
    return;
  }

  for (var item in grocerysItems) {
    if (format == 'uppercase') {
      print(item.toUpperCase());
    } else if (format == 'lowercase') {
      print(item.toLowerCase());
    } else {
      print(item); // Display as-is
    }
  }
}

// Searches for an item in the grocery list and returns its index if found, or null if not found.
// Displays a message based on the search result.

int? searchItem(List<String> grocerysItems, String? itemToSearch) {
  if (itemToSearch == null || itemToSearch.isEmpty) {
    print('Invalid input. Please enter a valid item.');
    return null;
  }

  int index = grocerysItems.indexOf(itemToSearch);
  if (index >= 0) {
    print('$itemToSearch found at position ${index + 1}.');
    return index;
  } else {
    print('$itemToSearch not found.');
    return null;
  }
}
