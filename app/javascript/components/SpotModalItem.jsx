import React, { Component } from 'react';

class SpotModalItem extends React.Component {
  render() {
    const { spot, handleClose, show } = this.props;
    const showHideClassName = show ? 'backdrop display-block' : 'backdrop display-none';

    return (
      <div className={showHideClassName}>
        <div className="modal">
          <div className="modal-header">
            <span className="close-btn" onClick={handleClose}>
              &times;
            </span>
            <h1>{spot.name}</h1>
          </div>
          <div className="modal-content">
            {spot.images.map((image) => {
              return <img key={image.id} className="spot-image" src={image.src} />;
            })}
            <p>{spot.description}</p>
            <p>Статус: {spot.status}</p>
            <p>Широта: {spot.latitude}</p>
            <p>Долгота: {spot.longitude}</p>
            <p>{spot.tag_list}</p>
            <p>Пользователь: {spot.user}</p>
          </div>
        </div>
      </div>
    );
  }
}

export default SpotModalItem;
