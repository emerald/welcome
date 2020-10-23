const Kilroy <- object Kilroy
  process
    const origin <- locate self
    const up <- origin.getActiveNodes

    % The real version
%    for i : Integer <- 1
%	while i <= up.upperbound
%	by i <- i + 1
%      const there <- up[i].gettheNode
%      move self to there
%    end for

%   The desired version
   var i : Integer <- 0
   for e in up
     const there <- e.gettheNode
     move self to there
     there$stdout.putString["Kilroy was here " || i.asString || "\n"]
     i <- i + 1
   end for

%   The sugar-removed version
%   begin
%     const u <- up
%     const lb <- u.lowerbound
%     const ub <- u.upperbound
%     var i : integer <- lb
%     loop
%	exit when i > ub
%	const e <- u[i]
%	begin
%	  const there <- e.gettheNode
%	  move self to there
%	end
%     i <- i + 1
%     end loop
%   end

    move self to origin
    origin$stdout.putString["Kilroy is here " || i.asString || "\n"]
  end process
end Kilroy