# Counter_App

# Description

Add a modified version of The counter app using the bloc pattern:

Manages the state using Counter Bloc (Bloc, Events, State)
and updates the UI using bloc consumer in counter view.

The state type in int to observe the counter value.
The counter bloc increases the state by 1 when the CounterIncrementPressedEvent is emitted.
And decreases the state by 1 when the CounterDecrementPressedEvent is emitted. using on event
handler in bloc.

So, we have separated the presentation layer from the business logic layer.

# App Structure
The structure of the app is:             
- counter folder in lib: contains counter bloc and view folder.
view folder: contains counter_view, counter_screen and widgets folder.         
widgets folder: contains my floating action button.    
- theme folder in lib: contains theme bloc.    
- observers folder in lib: contains my_bloc_observer class to observe all state changes in the application.     
** 
I build the body of the counter view using bloc consumer which listens to the counter value if reaches 5 or -5 and
then a message is shown and
rebuild the text widget in body according to the state using builder parameter.       
** 
And another body in the same scaffold /in comment section / which uses bloc listener which listens to the counter value if
reaches a negative value and bloc builder to update the text widget in body. (to achieve requirement 2).      
** 

## Dependencies

The following dependencies are needed to run this app:

- flutter_bloc  => https://pub.dev/packages/flutter_bloc

# Screenshots

The output screenshots in assets/images folder.