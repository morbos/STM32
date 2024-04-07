with HAL;                 use HAL;
with Utils;               use Utils;
package body Gen_List is
   procedure List_Init_Head (ListHead : in out ListNodePtr)
   is
   begin
      ListHead.Next := ListHead;
      ListHead.Prev := ListHead;
   end List_Init_Head;
   function List_Is_Empty (ListHead : ListNodePtr) return Boolean
   is
      Primask : UInt32;
      Result  : Boolean;
   begin
      Primask := Get_Primask;
      Disable_Interrupts;
      if ListHead.Next = ListHead then
         Result := True;
      else
         Result := False;
      end if;
      Set_Primask (Primask);
      return Result;
   end List_Is_Empty;
   procedure List_Insert_Head (ListHead : ListNodePtr; Node : ListNodePtr)
   is
      Primask : UInt32;
   begin
      Primask := Get_Primask;
      Disable_Interrupts;
      Node.Next := ListHead.Next;
      Node.Prev := ListHead;
      ListHead.Next := Node;
      Node.Next.Prev := Node;
      Set_Primask (Primask);
   end List_Insert_Head;
   procedure List_Insert_Tail (ListHead : ListNodePtr; Node : ListNodePtr)
   is
      Primask : UInt32;
   begin
      Primask := Get_Primask;
      Disable_Interrupts;
      Node.Next      := ListHead;
      Node.Prev      := ListHead.Prev;
      ListHead.Prev  := Node;
      Node.Prev.Next := Node;
      Set_Primask (Primask);
   end List_Insert_Tail;
   procedure List_Remove_Node (Node : in out ListNodePtr)
   is
      Primask : UInt32;
   begin
      Primask := Get_Primask;
      Disable_Interrupts;
      Node.Prev.Next := Node.Next;
      Node.Next.Prev := Node.Prev;
      Set_Primask (Primask);
   end List_Remove_Node;
   procedure List_Remove_Head (ListHead : ListNodePtr; Node : in out ListNodePtr)
   is
      Primask : UInt32;
   begin
      Primask := Get_Primask;
      Disable_Interrupts;
      Node := ListHead.Next;
      List_Remove_Node (ListHead.Next);
      Node.Next := null;
      Node.Prev := null;
      Set_Primask (Primask);
   end List_Remove_Head;
   procedure List_Remove_Tail (ListHead : ListNodePtr; Node : in out ListNodePtr)
   is
      Primask : UInt32;
   begin
      Primask := Get_Primask;
      Disable_Interrupts;
      Node := ListHead.Prev;
      List_Remove_Node (ListHead.Prev);
      Node.Next := null;
      Node.Prev := null;
      Set_Primask (Primask);
   end List_Remove_Tail;
   procedure List_Insert_Node_After (Node : in out ListNodePtr; Ref_Node : in out ListNodePtr)
   is
      Primask : UInt32;
   begin
      Primask := Get_Primask;
      Disable_Interrupts;
      Node.Next := Ref_Node.Next;
      Node.Prev := Ref_Node;
      Ref_Node.Next := Node;
      Node.Next.Prev := Node;
      Set_Primask (Primask);
   end List_Insert_Node_After;
   procedure List_Insert_Node_Before (Node : in out ListNodePtr; Ref_Node : in out ListNodePtr)
   is
      Primask : UInt32;
   begin
      Primask := Get_Primask;
      Disable_Interrupts;
      Node.Next := Ref_Node;
      Node.Prev := Ref_Node.Prev;
      Ref_Node.Prev := Node;
      Node.Prev.Next := Node;
      Set_Primask (Primask);
   end List_Insert_Node_Before;
   function List_Get_Size (ListHead : ListNodePtr) return Natural
   is
      Primask : UInt32;
      Size    : Natural := 0;
      Temp    : ListNodePtr;
   begin
      Primask := Get_Primask;
      Disable_Interrupts;
      Temp := ListHead.Next;
      while Temp /= ListHead loop
         Size := Size + 1;
         Temp := Temp.Next;
      end loop;
      Set_Primask (Primask);
      return Size;
   end List_Get_Size;
   procedure List_Get_Next_Node (Ref_Node : ListNodePtr; Node : out ListNodePtr)
   is
      Primask : UInt32;
   begin
      Primask := Get_Primask;
      Disable_Interrupts;
      Node := Ref_Node.Next;
      Set_Primask (Primask);
   end List_Get_Next_Node;
   procedure List_Get_Prev_Node (Ref_Node : ListNodePtr; Node : out ListNodePtr)
   is
      Primask : UInt32;
   begin
      Primask := Get_Primask;
      Disable_Interrupts;
      Node := Ref_Node.Prev;
      Set_Primask (Primask);
   end List_Get_Prev_Node;

end Gen_List;
