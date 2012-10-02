with Ada.Streams;
with Ada.Exceptions;

with Tkmrpc.Request;
with Tkmrpc.Response;

--  The generic Process_Stream procedure automatically converts stream data to
--  Tkmrpc request/response objects and passes them on to the given dispatch
--  procedure. The exception handler is called when the specified dispatching
--  procedure raises an exception.
generic
   with procedure Dispatch
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type);

   with procedure Exception_Handler
     (Ex : Ada.Exceptions.Exception_Occurrence) is null;

procedure Tkmrpc.Process_Stream
  (Recv_Data :     Ada.Streams.Stream_Element_Array;
   Send_Data : out Ada.Streams.Stream_Element_Array;
   Send_Last : out Ada.Streams.Stream_Element_Offset);
