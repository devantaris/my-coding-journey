#include <stdio.h>

int main() {
    int n;
    printf("Enter the number of elements: ");
    scanf("%d", &n);
    
    int arr[n];
    // Read elements
    for(int i=0; i<n; i++) {
        printf("Enter the element: ");
        scanf("%d", &arr[i]);
    }
    
    int unique[n];  // Array to store unique elements
    int count = 0;  // Count of unique elements
    
    // Check each element
    for(int i=0; i<n; i++) {
        int isDuplicate = 0;
        
        // Compare with existing unique elements
        for(int j=0; j<count; j++) {
            if(arr[i] == unique[j]) {
                isDuplicate = 1;
                break;
            }
        }
        
        // Add to unique array if not found
        if(!isDuplicate) {
            unique[count] = arr[i];
            count++;
        }
    }
    
    // Print unique elements
    printf("{");
    for(int i=0; i<count; i++) {
        printf("%d", unique[i]);
        if(i < count-1) printf(", ");
    }
    printf("}");
    
    return 0;
}