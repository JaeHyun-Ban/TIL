package algorithym;

public class treeEx00 {
    
    private treeEx00 left;
    private treeEx00 right;
    private Object data;

    public treeEx00(Object item){
        left = null;
        right = null;
        data = item;
    }
    //자신과 왼쪽 자식 노드를 연결해주는 method
    public void makeLeftSubTree(treeEx00 sub){
        if(this.left != null){
            this.left = null;
        }
        this.left = sub;
        
    }
    //자신과 오른쪽 자식 노드를 연결해주는 method
    public void makeRightSubTree(treeEx00 sub){
        if(this.right != null){
            this.right = null;
        }
        this.right = sub;
    }

    //자신의 data를 반환하는 함수
    public Object getData(){
        return this.data;
    }

    //자신의 왼쪽 자식노드를 반환하는 함수
    public treeEx00 getLeftSubTree(){
        return this.left;
    }
    //자신의 오른쪽 노드를 반환하는 함수
    public treeEx00 getRightSubTree(){
        return this.right;
    }

    public static void main(String[] args) {
        treeEx00 bt1 = new treeEx00(3);
        treeEx00 bt2 = new treeEx00(9);
        treeEx00 bt3 = new treeEx00(20);
        treeEx00 bt4 = new treeEx00(3);
        treeEx00 bt5 = new treeEx00(3);
        treeEx00 bt6 = new treeEx00(3);
        treeEx00 bt7 = new treeEx00(3);

        bt1.makeLeftSubTree(bt2);
        
    }

}
