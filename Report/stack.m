x ./stack.m, 800 bytes, 2 tape blocks
% Define an Integer stack creation object

export Stack

const Stack <-
  immutable object Stack
    const StackType <-
      typeobject StackType
        operation Push[n: Integer]
        operation Pop -> [n: Integer]
        function Empty -> [result : Boolean]
      end StackType

    export function getSignature -> [r : Signature]
      r <- StackType
    end getSignature

    export operation create -> [result : StackType]
      result <- 
        object aStack
	  const store <- Array.of[Integer].empty

	  export operation Push[n: Integer]
	    store.addUpper[n]
	  end Push

	  export operation Pop -> [n: Integer]
	    n <- store.removeUpper
	  end Pop

	  export function Empty -> [result : Boolean]
	    result <- store.empty
	  end Empty
        end aStack
    end create

end Stack
