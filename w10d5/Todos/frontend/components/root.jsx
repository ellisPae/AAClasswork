// wrap app component with react-redux Provider
// Provider - gives all components access to the store
    // => allowing components to read the application state and dispatch actions


import React from 'react';
import { Provider } from 'react-redux';
import App from './app';


const Root = ({store}) => (
    <Provider store={store}>
        <App />
    </Provider>
);




export default Root;



