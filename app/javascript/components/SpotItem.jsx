import React, { Component } from 'react';
import SpotModalItem from './SpotModalItem';
import SpotModalForm from './SpotModalForm';

class SpotItem extends React.Component {
  state = { showModal: false };

  onShowModal = () => {
    this.setState({ showModal: true });
  };

  onHideModal = () => {
    this.setState({ showModal: false });
  };

  render() {
    const { spot, onSubmit, onDelete } = this.props;

    return (
      <div className="spot-block__wrapper">
        {spot.manage ? (
          <SpotModalForm
            show={this.state.showModal}
            handleClose={this.onHideModal}
            spot={spot}
            onSubmit={onSubmit}
          ></SpotModalForm>
        ) : (
          <SpotModalItem
            show={this.state.showModal}
            handleClose={this.onHideModal}
            spot={spot}
          ></SpotModalItem>
        )}
        {spot.id ? (
          <>
            <div className="spot-info-container" onClick={this.onShowModal}>
              <div id="label-s--bold">{spot.status}</div>
              <div id="body-l">{spot.name}</div>
              <div id="body-m--bold">{spot.user}</div>
            </div>

            <div className="spot-image--small">
              {spot.images.length > 0 && <img src={spot.images[0].src} />}
            </div>
            <div className="line-break"></div>

            {spot.manage ? (
              <button onClick={() => onDelete(spot.id)}>Удалить точку</button>
            ) : ('')}

          </>
        ) : (
          <button onClick={this.onShowModal}>Создать точку</button>
        )}
      </div>
    );
  }
}

export default SpotItem;
