package example;
import java.util.*;

/**
 * DeepFirstSearch
 */
public class DeepFirstSearch {

    //그래프를 인접 리스트로 표현
    static class Graph {
        int V;  //노드의 수
        List<List<Integer>> adj; //인접 리스트

        public Graph(int V){
            this.V = V;
            adj = new ArrayList<>();
            for(int i = 0; i < V; ++i){
                adj.add(new ArrayList<>());
            }

        }
        //그래프에 간선 추가
        void addEdge(int v, int w){
            adj.get(v).add(w); 
        }
        
        //깊이 우선 탐색을 사용하여 그래프 탐색
        void DFS(int start){
            boolean[] visited = new boolean[V];//방문 여부를 저장하는 배열
            Stack<Integer> stack = new Stack<>();

            stack.push(start);
            visited[start] = true;

            while(!stack.isEmpty()){
                int current = stack.pop();
                System.out.println(current + " ");//현재 노드 출력

                for(Integer neighbor : adj.get(current)){
                    if(!visited[neighbor]){
                        stack.push(neighbor);
                        visited[neighbor] = true;
                    }
                }
            }
        }
        
    }

    public static void main(String[] args) {
        
        Graph graph = new Graph(7);
        graph.addEdge(0, 1);
        graph.addEdge(0, 2);
        graph.addEdge(0, 3);
        graph.addEdge(0, 4);
        graph.addEdge(0, 5);
        graph.addEdge(0, 6);
        graph.addEdge(0, 7);

        System.out.println("DFS결과: ");
        graph.DFS(0);

    }
    
}