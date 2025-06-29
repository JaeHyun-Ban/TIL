package programers;


public class pgm007 {
    /* 43162 네트워크 */
    public static void main(String[] args) {

    }

    public int soulution(int n, int[][] computers) {
        int count = 0;
        boolean[] visited = new boolean[n]; // 컴퓨터의 개수 만큼 방문여부 체크

        for(int i = 0; i < n; i++) {
            if(!visited[i]) { // i번째가 방문하지 않았다면
                dfs(i, computers, visited); // dfs실행
                count++;
            }
        }


        return count;
    }

    // dfs생성
    // 노드, 2차원 컴퓨터 배열, 방문여부배열을 매개변수로 받는다.
    public void dfs(int node, int[][] computers, boolean[] visited) {
        visited[node] = true;

        for(int i = 0; i < computers.length; i++) {
            // 노드가 i와 다르다
            // 컴퓨터(노드)와 연결된 i번째 컴퓨터가 1이라면
            if(i != node && computers[node][i] == 1 && !visited[i]) {
                dfs(i, computers, visited); // 다음노드로 다시 탐색
            }
        }

    }


}
