package dynamicprogramming;
import java.util.*;

public class TSP {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter number of cities: ");
        int n = sc.nextInt();
        if (n <= 1) {
            System.out.println("Path is not possible");
            return;
        }

        int[][] cost = new int[n+1][n+1];
        int[] tour = new int[n+1];

        System.out.println("Enter the cost matrix:");
        for (int i = 1; i <= n; i++)
            for (int j = 1; j <= n; j++)
                cost[i][j] = sc.nextInt();

        for (int i = 1; i <= n; i++) tour[i] = i;

        int minCost = tsp(cost, tour, 1, n);

        System.out.print("Optimal tour: ");
        for (int i = 1; i <= n; i++) System.out.print(tour[i] + "->");
        System.out.println("1");
        System.out.println("Min Cost = " + minCost);

        sc.close();
    }

    static int tsp(int[][] cost, int[] tour, int start, int n) {
        if (start == n - 1) return cost[tour[n-1]][tour[n]] + cost[tour[n]][1];

        int minCost = 999;
        int[] bestTour = new int[n+1];

        for (int i = start + 1; i <= n; i++) {
            int[] temp = tour.clone();
            temp[start+1] = tour[i];
            temp[i] = tour[start+1];

            int currCost = tsp(cost, temp, start+1, n) + cost[tour[start]][tour[i]];
            if (currCost < minCost) {
                minCost = currCost;
                System.arraycopy(temp, 1, bestTour, 1, n);
            }
        }
        System.arraycopy(bestTour, 1, tour, 1, n);
        return minCost;
    }
}

