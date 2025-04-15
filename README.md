This application divides the screen into two parts:
The left part is responsible for returning the previous color
The right part is responsible for generating a new random color.
I know that Bloc/Cubit should not be responsible for processing logic inside itself, it is better to put it in a repository and so on
I also created ColorModel on a quick hand, I decided not to create an entity, as it would take more time and I considered it unnecessary.

In order to save the state of the last color I used HydratedCubit, for UX
I also added get_it to register Cubit and possible for further testing.
 