import {createStore} from 'react';
// import rootReducer from '../reducers/root_reducer';
import { combineReducers } from 'redux';

const store = createStore(rootReducer);

export default store;
