#include <iostream>
#include <ctime>
using namespace std;

class ArrayAllocator {
public:
    static const int ARR_SIZE = 2091630;   // approximately maximum size for stack arr in my tests 

    // Static array
    void staticArray() {
        static int arr[ARR_SIZE];  
    }

    // Stack array 
    void stackArray() {
        int arr[ARR_SIZE];  

        // uncomment this to see the memory usage of stack array
        // cout << "Stack array memory usage: " << sizeof(arr) / (1024.0 * 1024.0) << "MB" << endl;  
    }

    // Heap array 
    void heapArray() {
        int* arr = new int[ARR_SIZE];  
        delete[] arr;    // free the heap memory
    }

    void measureStaticArray(int repeat_times) {
        clock_t start_time, end_time;
        start_time = clock();   // start time

        for (int i = 0; i < repeat_times; ++i) {
            staticArray();
        }

        end_time = clock(); // end time
        double duration = double(end_time - start_time) / CLOCKS_PER_SEC * 1000;  // in milliseconds
        cout << "Time taken by static array: " << duration << " ms" << endl;
    }

    // Measure time for stack array allocation
    void measureStackArray(int repeat_times) {
        clock_t start_time, end_time;
        start_time = clock();   // start time

        for (int i = 0; i < repeat_times; ++i) {
            stackArray();
        }

        end_time = clock(); // end time
        double duration = double(end_time - start_time) / CLOCKS_PER_SEC * 1000;
        cout << "Time taken by stack array: " << duration << " ms" << endl;
    }

    void measureHeapArray(int repeat_times) {
        clock_t start_time, end_time;
        start_time = clock();   // start time

        for (int i = 0; i < repeat_times; ++i) {
            heapArray();
        }

        end_time = clock();   // end time
        double duration = double(end_time - start_time) / CLOCKS_PER_SEC * 1000; 
        cout << "Time taken by heap array: " << duration << " ms" << endl;
    }
};

int main() {
    ArrayAllocator allocator;
    int choice;
    int repeat_times;
    char answer = 'y';

    do {
        // user input
        cout << "--------------------------------\n";
        cout << "Choose the type of array:\n";
        cout << "1. Static Array\n";
        cout << "2. Stack Array\n";
        cout << "3. Heap Array\n";
        cout << "4. All of the above\n";
        cout << "--------------------------------\n";
        cout << "Enter your choice (1, 2, 3, or 4): ";
        cin >> choice;

        if (cin.fail() || choice < 1 || choice > 4) {
            cin.clear();
            cin.ignore(1000, '\n');
            cout << "Invalid choice. Do you want to try again? (y/n): ";
            cin >> answer;
            if (answer == 'n' || answer == 'N') {
                break;
            }
            continue;
        }

        // this is to avoid going to start in invalid input, and ask only for repeat_times instead
        bool valid = false;
        do {
            cout << "Enter how many times you want to run the subprogram: ";
            cin >> repeat_times;

            if (cin.fail() || repeat_times <= 0) {
                cin.clear(); 
                cin.ignore(1000, '\n'); 
                cout << "Invalid input. Please enter a valid number of times.\n";
            } else {
                valid = true; 
            }
        } while (!valid); 
        
        // execute 
        switch (choice) {
            case 1:
                allocator.measureStaticArray(repeat_times);
                break;
            case 2:
                allocator.measureStackArray(repeat_times);
                break;
            case 3:
                allocator.measureHeapArray(repeat_times);
                break;
            case 4:
                allocator.measureStaticArray(repeat_times);
                allocator.measureStackArray(repeat_times);
                allocator.measureHeapArray(repeat_times);
                break;
        }

        // before exit
        cout << "--------------------------------\n";
        cout << "Do you want to run another subprogram? (y/n): ";
        cin >> answer;

    } while (answer == 'y' || answer == 'Y');

    cout << "Goodbye." << endl;

    return 0;
}