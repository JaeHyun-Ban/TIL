package leetcode;

import java.util.ArrayList;
import java.util.Stack;

/**
 * ltc155
 */
public class ltc155 {

class MinStack {

       // private Stack<Integer> data;
        // private Stack<Integer> minData;
        private ArrayList<Integer> data;
        private ArrayList<Integer> minData;
        private int top;
        private int minTop;

        public MinStack() {
            // data = new Stack<>();
            // minData = new Stack<>();
            data = new ArrayList<>();
            minData = new ArrayList<>();
            top = -1;
            minTop = -1;
        }

        public void push(int val) {

            // data.add(val);
            // if(minData.isEmpty()){
            //     minData.add(val);
            // } else {
            //     int min = minData.peek();
            //     minData.add(min <= val ? min : val);
            // }
            top++;
            data.add(top, val);
            if(minData.isEmpty()){  //비어있으면
                minTop++;            //top더하고
                minData.add(minTop, val);//0에 바로 넣어주고
            } else {                //비어있지 않다면 = minTop >= 0 -->????
                minTop++;           //minTop = 1
                int min = minData.get(minTop-1);//minTop = 1-1
                minData.add(minTop, min <= val ? min : val);
            }
        }

        public void pop() {
            // if(!data.isEmpty()){
            //     data.pop();
            //     minData.pop();
            // }
            if(!data.isEmpty()){
                top--;
                minTop--;
            }
        }

        public int top() {
            // return data.peek();
            return data.get(top);
        }

        public int getMin() {
            // return minData.peek();
            return minData.get(minTop);
        }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * MinStack obj = new MinStack();
 * obj.push(val);
 * obj.pop();
 * int param_3 = obj.top();
 * int param_4 = obj.getMin();
 */
}