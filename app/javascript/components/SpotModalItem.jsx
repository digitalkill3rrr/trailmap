import React, { Component } from 'react';

class SpotModalItem extends React.Component {
  render() {
    const { spot, handleClose, show } = this.props;
    const showHideClassName = show ? 'backdrop display-block' : 'backdrop display-none';

    return (
      <div className={showHideClassName}>
        <div className="spot-modal">
          <div className="spot-modal-header">
            <span className="close-btn" onClick={handleClose}>
              &times;
            </span>
            <h4>{spot.name}</h4>
            <div className="body16-bold">{spot.user}</div>
            <div className="body16-bold">{spot.status}</div>
          </div>
          <div className="spot-modal-content">
            <div className="body14">{spot.description}</div>
            {spot.images.map((image) => {
              return <img key={image.id} className="spot-images" src={image.src} />;
            })}
            <div className="coordinates-container">
              <div className="body14">ш {spot.latitude}</div>
              <div className="body14">д {spot.longitude}</div>
            </div>
            <div className="body14">{spot.tag_list}</div>
          </div>
        </div>
      </div>
    );
  }
}

export default SpotModalItem;
