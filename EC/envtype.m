export Environment, EnvironmentType

const EnvironmentType <- typeobject EnvironmentType
    function  getFileName -> [Tree]
    function  getFN -> [String]
    function  getStdout -> [OutStream]
    function  getITable -> [IdentTable]
    function  getNErrors -> [Integer]
    operation setNErrors [Integer]
    function  getRoot -> [Tree]
    operation setRoot [Tree]
    operation newid -> [Integer]
    operation error [String]
    operation errorf [String, RISA]
    operation Info [Integer, String, RISA]
    operation Warning [ln: Integer, String, RISA]
    operation SemanticError [ln: Integer, String, RISA]
    operation printf [String, RISA]
    operation pass [String, RISA]
    operation tassignTypes [String, RISA]
    function getTraceAssignTypes -> [Boolean]
    function getOptimizeInvocExecute -> [Boolean]
    operation ttypeCheck [String, RISA]
    function  getTraceTypeCheck -> [Boolean]
    function  getDoTypeCheck -> [Boolean]
    operation tinline [String, RISA]
    function getTraceInline -> [Boolean]
    operation done[Tree]
    function  getln -> [Integer]
    operation checkNames [Tree, Tree]
    operation distribute [TreeMaker, Tree, Tree, Tree] -> [Tree]
    function  getrootst -> [SymbolTable]
    function  getExportTree -> [Boolean]
    function  getExplainNonManifests -> [Boolean]
    function  getNameSpaceFile -> [String]
    function  getTraceCode -> [Boolean]
    function  getTraceEvaluateManifests -> [Boolean]
    function  getConformTable -> [IIBTable]
    function  getGenerateDebugInfo -> [Boolean]
    function  getGenerateBuiltin -> [Boolean]
    function  getGenerateConcurrent -> [Boolean]
    function  getExecuteNow -> [Boolean]
    function  getGenerateATs -> [Boolean]
    function  getPadByteCodes -> [Boolean]
    function  getNeedMoreEvaluateManifest -> [Boolean]
    operation setNeedMoreEvaluateManifest [Boolean]
    function  getTraceAllocation -> [Boolean]
    operation tGenerate [String, RISA]
    operation tAllocation [String, RISA]
    function  getExternalDirectory -> [Directory]
    operation setExternalDirectory [Directory]
    function  getInvoc -> [InvocType]
    function  getAtlit -> [AtlitType]
    function  getUseAbCons -> [Boolean]
    function  getCompilingBuiltins -> [Boolean]
    function  getCompilingCompiler -> [Boolean]
    function  getWhy -> [Boolean]
    operation setWhy [Boolean]
    function  getWarnShadows -> [Boolean]
    function  getGenerateViewChecking -> [Boolean]
    function  getDoingIdsEarly -> [Boolean]
    function  getDumpEvaluateManifests -> [Boolean]
    operation scheduleDeferredTypeCheck[t : Tree, aparam : Any, apsym : Any, avalue : Any, i : Integer]
end EnvironmentType

const Environment <- immutable object Environment
    export function getSignature -> [r : Signature]
        r <- EnvironmentType
    end getSignature
    export operation getEnv -> [r : EnvironmentType]
        var a : Any
        primitive var "GETENV" [a] <- []
        r <- view a as EnvironmentType
    end getEnv
    export operation getPtr [a : Any] -> [r : Integer]
        primitive  [r] <- [a]
    end getPtr
end Environment
