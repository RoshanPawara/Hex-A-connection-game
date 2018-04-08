/* Used for the Disjoint-set data structure */
class Node
{
  int value;    /* value in a node */
  Node parent;  /* points to parent of Node */
  int rank;     /* rank of a node */
  int size;     /* size of a node */
  
  Node(int value)
  {
    this.value  = value;
    this.parent = null;
  }
                
}
