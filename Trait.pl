/*Begin Question 4.1*/
not_prime_loop( Q, _ )
  :-
    Q =< 1.
not_prime_loop( Q, D )
  :-
    D > 1,
    Q mod D =:= 0.
not_prime_loop( Q, D )
  :-
    D > 1,
    Q mod D =\= 0,
  	D1 is D - 1,
    not_prime_loop( Q, D1 ).

prime( N )
  :-
    D is N // 2,
    \+ not_prime_loop( N, D ).

/*End Question 4.1*/

/*Begin Question 4.2*/
possible( X, Y, Z )
  :-
    % No point checking from 0-123, as the smallest
    % 3-digit number with different digits 1-9 is 123.
	between( 123, 359, X ),
	between( 123, 359, Y ),
    between( 123, 359, Z ).

/*End Question 4.2*/    

/*Begin Question 4.3*/
acceptable( X, Y, Z )
  :-
    % Convert X, Y, Z into a list [X0..X2, Y0..Y2, Z0..Z2]
    X0 is X // 100,
    X1 is (X - (X0 * 100)) // 10,
    X2 is (X - (X0 * 100) - (X1 * 10)),
    Y0 is Y // 100,
    Y1 is (Y - (Y0 * 100)) // 10,
    Y2 is (Y - (Y0 * 100) - (Y1 * 10)),
    Z0 is Z // 100,
    Z1 is (Z - (Z0 * 100)) // 10,
    Z2 is (Z - (Z0 * 100) - (Z1 * 10)),
    XYZ = [X0, X1, X2, Y0, Y1, Y2, Z0, Z1, Z2],
    
    % Ensure XYZ is a permutation of [1..9], so that
    % every digit appears only once
    L = [1,2,3,4,5,6,7,8,9],
    permutation( L, XYZ ),
    
    % And finally, X, Y and Z must not be prime
    \+ prime( X ),
    \+ prime( Y ),
    \+ prime( Z ).

trait( X, Y, Z )
  :-
    possible( X, Y, Z ),
    acceptable( X, Y, Z ),
    
    % Ascending order.
    X < Y,
    Y < Z.

/*End Question 4.3*/

% any main predicates for testing goes here
main
    :-
    prime( 17 ),
    
    acceptable( 169, 247, 358 ),
    
    write_ln("trait predicate:"),
    
    trait( X, Y, Z ),
    write_ln("X = " + X),
    write_ln("Y = " + Y),
    write_ln("Z = " + Z),
    write_ln(""),
    
    write_ln("possible predicate:"),
    
    possible( A, B, C ),
    write_ln("X = " + A),
    write_ln("Y = " + B),
    write_ln("Z = " + C).