import { combineReducers } from 'redux';
import todosReducer from './todos_reducer';

// const rootReducer = (state = {}) => {
// return state;
// };

const rootReducer = combineReducers({
  todos: todosReducer,
  // cart: cartReducer,
});



export default rootReducer;