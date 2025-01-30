import React, { useEffect } from 'react';
import { Alert, Pressable, StyleSheet, Text, View, NativeModules, Platform } from 'react-native';

const { FloatingView, PopupModule } = NativeModules;

const App = () => {

console.log(NativeModules,"NativeModulesNativeModulesNativeModules");

  // async function requestOverlayPermission() {
  //   if (Platform.OS === 'android') {
  //     try {
  //       const hasPermission = await FloatingView.checkOverlayPermission();
  //       if (!hasPermission) {
  //         FloatingView.requestOverlayPermission();
  //       }
  //     } catch (error) {
  //       Alert.alert('Error', 'Failed to check or request overlay permission.');
  //     }
  //   }
  // }

  // useEffect(() => {
  //   requestOverlayPermission();
  // }, []);

  // async function showFloatingView() {
  //   try {
  //     await FloatingView.showFloatingView();
  //   } catch (error) {
  //     Alert.alert('Error', 'Failed to show the floating view.');
  //   }
  // }

  // async function hideFloatingView() {
  //   try {
  //     await FloatingView.hideFloatingView();
  //   } catch (error) {
  //     Alert.alert('Error', 'Failed to hide the floating view.');
  //   }
  // }

  //  ios implementation

  

  const showFloatingView = () =>{
    PopupModule.showPopup();
  }

  const hideFloatingView = () => {
    Alert.alert('hidinggggg')
  }

  return (
    <View style={styles.container}>
      <Pressable style={styles.button} onPress={showFloatingView}>
        <Text style={styles.buttonText}>Show Floating View</Text>
      </Pressable>

      <Pressable style={styles.button} onPress={hideFloatingView}>
        <Text style={styles.buttonText}>Hide Floating View</Text>
      </Pressable>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    justifyContent: 'center',
    alignItems: 'center',
    flex: 1,
    backgroundColor: '#f5f5f5',
  },
  button: {
    margin: 10,
    padding: 10,
    backgroundColor: '#007BFF',
    borderRadius: 5,
  },
  buttonText: {
    color: '#fff',
    fontSize: 16,
    fontWeight: 'bold',
  },
});

export default App;
