generic
   type Payload is private;
   Limit : Natural;
package Gen_List is
   type ListNode;
   type ListNodePtr is access all ListNode;

   type ListNode is record
      Next : ListNodePtr;
      Prev : ListNodePtr;
      Elem : Payload;
   end record;

   type ListNode_Array is array (1 .. Limit) of aliased ListNode;

   procedure List_Init_Head
     (ListHead : in out ListNodePtr);

   function List_Is_Empty
     (ListHead : ListNodePtr) return Boolean;

   procedure List_Insert_Head
     (ListHead : ListNodePtr;
      Node     : ListNodePtr);

   procedure List_Insert_Tail
     (ListHead : ListNodePtr;
      Node     : ListNodePtr);

   procedure List_Remove_Node
     (Node : in out ListNodePtr);

   procedure List_Remove_Head
     (ListHead : in out ListNodePtr;
      Node     : in out ListNodePtr);

   procedure List_Remove_Tail
     (ListHead : ListNodePtr;
      Node     : in out ListNodePtr);

   procedure List_Insert_Node_After
     (Node     : in out ListNodePtr;
      Ref_Node : in out ListNodePtr);

   procedure List_Insert_Node_Before
     (Node     : in out ListNodePtr;
      Ref_Node : in out ListNodePtr);

   function List_Get_Size
     (ListHead : ListNodePtr) return Natural;

   procedure List_Get_Next_Node
     (Ref_Node : ListNodePtr;
      Node     : out ListNodePtr);

   procedure List_Get_Prev_Node
     (Ref_Node : ListNodePtr;
      Node     : out ListNodePtr);

end Gen_List;
