import React from 'react';
import ReactDOM from 'react-dom';
import SpotList from 'components/SpotList';

const addSpotsSidebar = () => {
  const spotsSidebar = document.getElementById('spots-sidebar');

  if (spotsSidebar) {
    ReactDOM.render(<SpotList routeId={spotsSidebar.dataset.routeId} />, spotsSidebar);
  }
};

export { addSpotsSidebar };
