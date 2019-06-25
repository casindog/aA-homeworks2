import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);

    // part 1
    store.dispatch = addLoggingToDispatch(store);

    // part 2
    store = applyMiddlewares(store, addLoggingToDispatch);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

// part 1
// const addLoggingToDispatch = (store) => {
//   const x = store.dispatch;
//   return (action) => {
//     console.log(store.getState());
//     console.log(action);
//     x(action);
//     console.log(store.getState());
//   }

// }

// part 2
function addLoggingToDispatch(store) {
  let dispatch = store.dispatch;
  return function (next) {
    return function (action) {
      console.log(store.getState());
      console.log(action);
      x(action);
      console.log(store.getState());
    };
  };
};