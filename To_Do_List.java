import java.util.Scanner;

public class To_Do_List {
    static final int MAX_TASKS = 10;
    static int taskCount = 0;
    static Scanner scanner = new Scanner(System.in);
    static String[] titles = new String[MAX_TASKS];
    static String[] dueDateTimes = new String[MAX_TASKS];

    public static void main(String[] a) {
        int choice;
        do {
            displayMenu();
            choice = scanner.nextInt();
            scanner.nextLine(); // Consume newline

            switch (choice) {
                case 1:
                    addTask();
                    break;
                case 2:
                    viewTasks();
                    break;
                case 3:
                    deleteTask();
                    break;
                case 4:
                    editTask();
                    break;
               
                case 6:
                    searchTaskByTitle();
                    break;
                case 7:
                    System.out.println("Exit");
                    break;
                default:
                    System.out.println("Invalid choice. Please enter a valid option.");
                    break;
            }
        } while (choice != 7);
    }

    public static void displayMenu() {
        System.out.println("1. Add Task/Tasks");
        System.out.println("2. View Tasks");
        System.out.println("3. Delete a Task");
        System.out.println("4. Edit a Task");
        System.out.println("6. Search Tasks by Title");
        System.out.println("7. Exit");
        System.out.print("Enter your choice: ");
    }

    public static void addTask() {
        if (taskCount < MAX_TASKS) {
            titles[taskCount] = getTaskDetails();
            taskCount++;
            System.out.println("Task added successfully!");
        } else {
            System.out.println("Task limit reached. Cannot add more tasks.");
        }
    }

    public static void viewTasks() {
        if (taskCount == 0) {
            System.out.println("No tasks added yet.");
        } else {
            System.out.println("------ Tasks ------");
            for (int i = 0; i < taskCount; i++) {
                displayTask(i);
            }
        }
    }

    public static void deleteTask() {
        if (taskCount == 0) {
            System.out.println("No tasks to delete.");
        } else {
            viewTasks();
            System.out.print("Enter the task number to delete: ");
            int taskToDelete;
            try {
                taskToDelete = scanner.nextInt();
                scanner.nextLine(); // Consume newline

                if (taskToDelete < 1 || taskToDelete > taskCount) {
                    System.out.println("Invalid task number.");
                    return;
                }

                for (int i = taskToDelete - 1; i < taskCount - 1; i++) {
                    titles[i] = titles[i + 1];
                    dueDateTimes[i] = dueDateTimes[i + 1];
                }
                titles[taskCount - 1] = null;
                dueDateTimes[taskCount - 1] = null;
                taskCount--;
                System.out.println("Task deleted successfully!");
            } catch (Exception e) {
                System.out.println("Invalid input. Please enter a valid task number.");
                scanner.nextLine(); // Consume newline
            }
        }
    }
public static void editTask() {
        if (taskCount == 0) {
            System.out.println("No tasks to edit.");
        } else {
            viewTasks();
            System.out.print("Enter the task number to edit: ");
            int taskToEdit;
            try {
                taskToEdit = scanner.nextInt();
                scanner.nextLine(); // Consume newline

                if (taskToEdit < 1 || taskToEdit > taskCount) {
                    System.out.println("Invalid task number.");
                    return;
                }

                System.out.print("Enter new task title: ");
                titles[taskToEdit - 1] = scanner.nextLine();
                System.out.print("Enter new due date and time (YYYY-MM-DD HH:MM AM/PM): ");
                dueDateTimes[taskToEdit - 1] = scanner.nextLine();
                System.out.println("Task edited successfully!");
            } catch (Exception e) {
                System.out.println("Invalid input. Please enter a valid task number.");
                scanner.nextLine(); // Consume newline
            }
        }
    }

   

    public static void searchTaskByTitle() {
        if (taskCount == 0) {
            System.out.println("No tasks to search.");
        } else {
            System.out.print("Enter the title to search: ");
            String searchTitle = scanner.nextLine();
            boolean found = false;

            System.out.println("------ Search Results ------");
            for (int i = 0; i < taskCount; i++) {
                if (titles[i].toLowerCase().contains(searchTitle.toLowerCase())) {
                    displayTask(i);
                    found = true;
                }
            }

            if (!found) {
                System.out.println("No tasks found with the given title.");
            }
        }
    }

    public static String getTaskDetails() {
        System.out.print("Enter task title: ");
        return scanner.nextLine();
    }

    public static String getTaskDueDateTime() {
        System.out.print("Enter due date and time (YYYY-MM-DD HH:MM AM/PM): ");
        return scanner.nextLine();
     }
    // public static String getTaskDetails() {
    //     System.out.print("Enter task title, due date, and time (Title YYYY-MM-DD HH:MM AM/PM): ");
    //     return scanner.nextLine();
    // }

    public static void displayTask(int index) {
        System.out.println("Task " + (index + 1) + ": Title: " + titles[index]);
    }
}

