package algorithym;

import java.util.*;

public class dfsEx {
    
    class Node{
        int data;
        LinkedList<Node> adjacent;
        boolean marked;

        Node(int data){
            this.data = data;
            this.marked = false;
            adjacent = new LinkedList<Node>();
        }
    }
    Node[] nodes;
    void Graph(int size){
        nodes = new Node[size];
        for(int i = 0; i < size; i++) {
            nodes[i] = new Node(i);
        }
    }
    void addEdge(int i1, int i2){
//        Node n1 = new nodes[i1];
//        Node n2 = new nodes[i2];
    }
    /*
        0
       /
      1
      |
      |    
    
     */
}
