import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';

const configureStore = createStore(rootReducer);

export default configureStore;



// store holds a reference to an application state
// the store handles updating state when actions are dispatched and tells
// the necessary components to re-render