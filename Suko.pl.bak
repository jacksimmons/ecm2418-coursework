/*Begin Question 3.1*/
get_member( 0, [H|_], H ).
get_member( N, [_|T], M )
  :-
    N1 is N - 1,
    get_member( N1, T, M ).

indices( [], _, [] ).
indices( [IH|IT], XS, [ES|ET] )
  :-
    get_member( IH, XS, ES ),
    indices( IT, XS, ET ).

/*End Question 3.1*/

/*Begin Question 3.2*/
possible( GRID )
  :-
    L = [1,2,3,4,5,6,7,8,9],
    permutation( L, GRID ).

/*End Question 3.2*/

/*Begin Question 3.3*/
sum( [], S, S ).
sum( [H|T], 0, F )
  :-
    sum( T, H, F ).
sum( [H|T], S, F )
  :-
    F1 is S + H,
    sum( T, F1, F ).

acceptable( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID )
  :-
    % Colour 1
    indices( US, GRID, UX ),
    sum( UX, 0, U ),
    % Colour 2
    indices( VS, GRID, VX ),
    sum( VX, 0, V ),
    % Colour 3
    indices( WS, GRID, WX ),
    sum( WX, 0, W ),
    % 0, 1, 3, 4
    indices( [0,1,3,4], GRID, AS ),
    sum( AS, 0, T0 ),
    % 1, 2, 4, 5
    indices( [1,2,4,5], GRID, BS ),
    sum( BS, 0, T1 ),
    % 3, 4, 6, 7
    indices( [3,4,6,7], GRID, CS ),
    sum( CS, 0, T2 ),
    % 4, 5, 7, 8
    indices( [4,5,7,8], GRID, DS ),
    sum( DS, 0, T3 ).

suko( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID )
  :-
    possible( GRID ),
    acceptable( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID ).
suko( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID )
  :-
    possible( GRID ),
    \+ acceptable( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID ),
    suko( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID ).
    
/*End Question 3.3*/

% any main predicates for testing goes here
main
    :- suko( 15, 14, 26, 23, [0,1,2,3], 16, [4,6,7], 17, [5,8], 12, GRID ),
	write(GRID).