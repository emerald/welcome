export Processdef


const processdef <- class Processdef (Tree) [xxbody : Tree]
  field body : Tree <- xxbody
  var isSynchronizingProcess : Boolean <- false

  export function upperbound -> [r : Integer]
    r <- 0
  end upperbound
  export function getElement [i : Integer] -> [r : Tree]
    if i = 0 then
      r <- body
    end if
  end getElement
  export operation setElement [i : Integer, r : Tree]
    if i = 0 then
      body <- r
    end if
  end setElement
  export operation copy [i : Integer] -> [r : Tree]
    var nbody : Tree
    if body !== nil then nbody <- body.copy[i] end if
    r <- processdef.create[ln, nbody]
  end copy

  export operation removeSugar [ob : Tree] -> [r : Tree]
    const realob <- view ob as Monitorable
    r <- FTree.removeSugar[self, ob]
    if realob$isSynchronized then
      isSynchronizingProcess <- true
    end if
  end removeSugar

  export operation resolveSymbols [pst : SymbolTable, nexp : Integer]
    pst$inInitially <- false
    FTree.resolveSymbols[pst, self, 0]
    pst$inInitially <- true
  end resolveSymbols

  export operation generate[xct : Printable]
    const ct <- view xct as CTCode
    const ove <- opvectore.create["process"]
    const mybc <- bytecode.create[ct$literals]
    const ov <- ct$opVec
    const templ <- Template.create
    const bb <- view self$body as Block

    const returnlabel : Integer <- mybc.declareLabel
    ove$templ <- templ
    mybc.nest[returnlabel]

    ov[1] <- ove
    % Generate the template
    bb$st.writeTemplate[templ, 'L']

    mybc.setLocalSize[bb$st$localSize]

    self$body.generate[mybc]

    mybc.lineNumber[self$ln]
    mybc.defineLabel[returnlabel]
    if isSynchronizingProcess then
      mybc.addCode["SYNCHDIE"]
    end if
    mybc.addCode["QUITP"]
    ove$code <- mybc.getString
    ove$others <- mybc$others
    begin
      const lninfo <- mybc.getLNInfo
      if lninfo !== nil then
	templ.addLineNumbers[lninfo]
      end if
    end
  end generate

  export function asString -> [r : String]
    r <- "processdef"
  end asString
end Processdef
