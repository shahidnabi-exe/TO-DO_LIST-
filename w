[33mcommit 904564eb83f816718d52450d0ab3f45e405e6aa3[m[33m ([m[1;36mHEAD -> [m[1;32mmain[m[33m)[m
Author: Shahid Nabi <128903863+shahidnabi-exe@users.noreply.github.com>
Date:   Thu Jun 20 19:56:51 2024 +0500

    first commit

[1mdiff --git a/To_Do_List.class b/To_Do_List.class[m
[1mnew file mode 100644[m
[1mindex 0000000..5d3ac42[m
Binary files /dev/null and b/To_Do_List.class differ
[1mdiff --git a/To_Do_List.java b/To_Do_List.java[m
[1mnew file mode 100644[m
[1mindex 0000000..5bee6f0[m
[1m--- /dev/null[m
[1m+++ b/To_Do_List.java[m
[36m@@ -0,0 +1,175 @@[m
[32m+[m[32mimport java.util.Scanner;[m
[32m+[m
[32m+[m[32mpublic class To_Do_List {[m
[32m+[m[32m    static final int MAX_TASKS = 10;[m
[32m+[m[32m    static int taskCount = 0;[m
[32m+[m[32m    static Scanner scanner = new Scanner(System.in);[m
[32m+[m[32m    static String[] titles = new String[MAX_TASKS];[m
[32m+[m[32m    static String[] dueDateTimes = new String[MAX_TASKS];[m
[32m+[m
[32m+[m[32m    public static void main(String[] a) {[m
[32m+[m[32m        int choice;[m
[32m+[m[32m        do {[m
[32m+[m[32m            displayMenu();[m
[32m+[m[32m            choice = scanner.nextInt();[m
[32m+[m[32m            scanner.nextLine(); // Consume newline[m
[32m+[m
[32m+[m[32m            switch (choice) {[m
[32m+[m[32m                case 1:[m
[32m+[m[32m                    addTask();[m
[32m+[m[32m                    break;[m
[32m+[m[32m                case 2:[m
[32m+[m[32m                    viewTasks();[m
[32m+[m[32m                    break;[m
[32m+[m[32m                case 3:[m
[32m+[m[32m                    deleteTask();[m
[32m+[m[32m                    break;[m
[32m+[m[32m                case 4:[m
[32m+[m[32m                    editTask();[m
[32m+[m[32m                    break;[m
[32m+[m[41m               [m
[32m+[m[32m                case 6:[m
[32m+[m[32m                    searchTaskByTitle();[m
[32m+[m[32m                    break;[m
[32m+[m[32m                case 7:[m
[32m+[m[32m                    System.out.println("Exit");[m
[32m+[m[32m                    break;[m
[32m+[m[32m                default:[m
[32m+[m[32m                    System.out.println("Invalid choice. Please enter a valid option.");[m
[32m+[m[32m                    break;[m
[32m+[m[32m            }[m
[32m+[m[32m        } while (choice != 7);[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public static void displayMenu() {[m
[32m+[m[32m        System.out.println("1. Add Task/Tasks");[m
[32m+[m[32m        System.out.println("2. View Tasks");[m
[32m+[m[32m        System.out.println("3. Delete a Task");[m
[32m+[m[32m        System.out.println("4. Edit a Task");[m
[32m+[m[32m        System.out.println("6. Search Tasks by Title");[m
[32m+[m[32m        System.out.println("7. Exit");[m
[32m+[m[32m        System.out.print("Enter your choice: ");[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public static void addTask() {[m
[32m+[m[32m        if (taskCount < MAX_TASKS) {[m
[32m+[m[32m            titles[taskCount] = getTaskDetails();[m
[32m+[m[32m            taskCount++;[m
[32m+[m[32m            System.out.println("Task added successfully!");[m
[32m+[m[32m        } else {[m
[32m+[m[32m            System.out.println("Task limit reached. Cannot add more tasks.");[m
[32m+[m[32m        }[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public static void viewTasks() {[m
[32m+[m[32m        if (taskCount == 0) {[m
[32m+[m[32m            System.out.println("No tasks added yet.");[m
[32m+[m[32m        } else {[m
[32m+[m[32m            System.out.println("------ Tasks ------");[m
[32m+[m[32m            for (int i = 0; i < taskCount; i++) {[m
[32m+[m[32m                displayTask(i);[m
[32m+[m[32m            }[m
[32m+[m[32m        }[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public static void deleteTask() {[m
[32m+[m[32m        if (taskCount == 0) {[m
[32m+[m[32m            System.out.println("No tasks to delete.");[m
[32m+[m[32m        } else {[m
[32m+[m[32m            viewTasks();[m
[32m+[m[32m            System.out.print("Enter the task number to delete: ");[m
[32m+[m[32m            int taskToDelete;[m
[32m+[m[32m            try {[m
[32m+[m[32m                taskToDelete = scanner.nextInt();[m
[32m+[m[32m                scanner.nextLine(); // Consume newline[m
[32m+[m
[32m+[m[32m                if (taskToDelete < 1 || taskToDelete > taskCount) {[m
[32m+[m[32m                    System.out.println("Invalid task number.");[m
[32m+[m[32m                    return;[m
[32m+[m[32m                }[m
[32m+[m
[32m+[m[32m                for (int i = taskToDelete - 1; i < taskCount - 1; i++) {[m
[32m+[m[32m                    titles[i] = titles[i + 1];[m
[32m+[m[32m                    dueDateTimes[i] = dueDateTimes[i + 1];[m
[32m+[m[32m                }[m
[32m+[m[32m                titles[taskCount - 1] = null;[m
[32m+[m[32m                dueDateTimes[taskCount - 1] = null;[m
[32m+[m[32m                taskCount--;[m
[32m+[m[32m                System.out.println("Task deleted successfully!");[m
[32m+[m[32m            } catch (Exception e) {[m
[32m+[m[32m                System.out.println("Invalid input. Please enter a valid task number.");[m
[32m+[m[32m                scanner.nextLine(); // Consume newline[m
[32m+[m[32m            }[m
[32m+[m[32m        }[m
[32m+[m[32m    }[m
[32m+[m[32mpublic static void editTask() {[m
[32m+[m[32m        if (taskCount == 0) {[m
[32m+[m[32m            System.out.println("No tasks to edit.");[m
[32m+[m[32m        } else {[m
[32m+[m[32m            viewTasks();[m
[32m+[m[32m            System.out.print("Enter the task number to edit: ");[m
[32m+[m[32m            int taskToEdit;[m
[32m+[m[32m            try {[m
[32m+[m[32m                taskToEdit = scanner.nextInt();[m
[32m+[m[32m                scanner.nextLine(); // Consume newline[m
[32m+[m
[32m+[m[32m                if (taskToEdit < 1 || taskToEdit > taskCount) {[m
[32m+[m[32m                    System.out.println("Invalid task number.");[m
[32m+[m[32m                    return;[m
[32m+[m[32m                }[m
[32m+[m
[32m+[m[32m                System.out.print("Enter new task title: ");[m
[32m+[m[32m                titles[taskToEdit - 1] = scanner.nextLine();[m
[32m+[m[32m                System.out.print("Enter new due date and time (YYYY-MM-DD HH:MM AM/PM): ");[m
[32m+[m[32m                dueDateTimes[taskToEdit - 1] = scanner.nextLine();[m
[32m+[m[32m                System.out.println("Task edited successfully!");[m
[32m+[m[32m            } catch (Exception e) {[m
[32m+[m[32m                System.out.println("Invalid input. Please enter a valid task number.");[m
[32m+[m[32m                scanner.nextLine(); // Consume newline[m
[32m+[m[32m            }[m
[32m+[m[32m        }[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[41m   [m
[32m+[m
[32m+[m[32m    public static void searchTaskByTitle() {[m
[32m+[m[32m        if (taskCount == 0) {[m
[32m+[m[32m            System.out.println("No tasks to search.");[m
[32m+[m[32m        } else {[m
[32m+[m[32m            System.out.print("Enter the title to search: ");[m
[32m+[m[32m            String searchTitle = scanner.nextLine();[m
[32m+[m[32m            boolean found = false;[m
[32m+[m
[32m+[m[32m            System.out.println("------ Search Results ------");[m
[32m+[m[32m            for (int i = 0; i < taskCount; i++) {[m
[32m+[m[32m                if (titles[i].toLowerCase().contains(searchTitle.toLowerCase())) {[m
[32m+[m[32m                    displayTask(i);[m
[32m+[m[32m                    found = true;[m
[32m+[m[32m                }[m
[32m+[m[32m            }[m
[32m+[m
[32m+[m[32m            if (!found) {[m
[32m+[m[32m                System.out.println("No tasks found with the given title.");[m
[32m+[m[32m            }[m
[32m+[m[32m        }[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public static String getTaskDetails() {[m
[32m+[m[32m        System.out.print("Enter task title: ");[m
[32m+[m[32m        return scanner.nextLine();[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public static String getTaskDueDateTime() {[m
[32m+[m[32m        System.out.print("Enter due date and time (YYYY-MM-DD HH:MM AM/PM): ");[m
[32m+[m[32m        return scanner.nextLine();[m
[32m+[m[32m     }[m
[32m+[m[32m    // public static String getTaskDetails() {[m
[32m+[m[32m    //     System.out.print("Enter task title, due date, and time (Title YYYY-MM-DD HH:MM AM/PM): ");[m
[32m+[m[32m    //     return scanner.nextLine();[m
[32m+[m[32m    // }[m
[32m+[m
[32m+[m[32m    public static void displayTask(int index) {[m
[32m+[m[32m        System.out.println("Task " + (index + 1) + ": Title: " + titles[index]);[m
[32m+[m[32m    }[m
[32m+[m[32m}[m
[32m+[m
