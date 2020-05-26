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
      <div className="spot-card">
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
            <div className="spot-image">
              {spot.images.length > 0 && <img src={spot.images[0].src} />}

              <div className="spot-status">
                <div className="body14">{spot.status}</div>
              </div>
            </div>
            <div className="spot-info__container" onClick={this.onShowModal}>
              <div className="spot-header">
                <div className="body18-bold">{spot.name}</div>
                <div className="body14">{spot.description.substr(0, 70) + '...'}</div>
              </div>

              {spot.manage ? (
                <div className="spot-edit" onClick={() => onDelete(spot.id)}>
                  <div className="body14">Удалить точку</div>
                </div>
              ) : ('')}
            </div>
          </>
        ) : (
          <div className="spot-new" onClick={this.onShowModal}>
            <div className="body14">+ Создать точку</div>
          </div>
        )}
      </div>
    );
  }
}

export default SpotItem;
