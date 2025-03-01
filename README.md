# Counter_App

# Description

Simple counter app with counter text and two buttons increase & decrease.             
Manages the state using Counter Cubit and updates the UI using bloc consumer in counter view.

The **state type** is **int** to observe the counter value.      
The counter cubit increases the state by 1 using incrementCounter method.    
And decreases the state by 1 using decrementCounter method.    

So, we have separated the presentation layer from the business logic layer.         

--------------------------------

# App Structure

The structure of the app in lib folder is:             
- **counter folder**: contains counter cubit and view folder.
- **Observers folder**: contains a BlocObserver to observe all state changes in the application.                                  
                                                                                                       
**Counter folder contains**:                 
   - **counter cubit folder**: to manage counter state.                  
   - **view folder**: contains counter_view, counter_view2, counter_screen and widgets folder.                                                              

I build the body of **the counter view** using bloc consumer which listens to the counter value if reaches 10 or -10 and
then a message is shown and
rebuild the text widget in body according to the state using builder parameter.       
**
And **the counter view2** uses bloc listener which listens to the counter value if
reaches a negative value and bloc builder to update the text widget in body. (to achieve 5,6 points in requirements).      
**

------------------
## How to Run

1. Clone the repository.
2. Run `flutter pub get` to install dependencies.
3. Run `flutter run` to start the app.
   
---------------------------------------
## Dependencies

The following dependencies are needed to run this app:

- flutter_bloc  => https://pub.dev/packages/flutter_bloc

# Screenshots

The output screenshots in assets folder.

------------------

# Note: 

The **Create different Blocs task** in **CounterBloc branch**.

