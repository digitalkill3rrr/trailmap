import React, { Component } from 'react';
import SpotModalItem from './SpotModalItem';
import SpotModalForm from './SpotModalForm';

class SpotItem extends React.Component {
  state = { showModal: false, showReport: false };

  onShowModal = () => {
    this.setState({ showModal: true });
  };

  onHideModal = () => {
    this.setState({ showModal: false });
  };

  toggleReport = () => {
    this.setState((prevState) => ({ showReport: !prevState.showReport }));
  };

  render() {
    const { spot, onSubmit, onDelete, onShowReportModal } = this.props;

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
                <div className="body14" onClick={this.toggleReport}>
                  {spot.status}
                </div>
              </div>
            </div>
            <div className="spot-info_wrapper">
              {this.state.showReport && spot.report ? (
                <div className="spot-info__container">
                  <div className="spot-header">
                    <div className="body14">{spot.report}</div>
                  </div>
                </div>
              ) : (
              <div className="spot-info__container" onClick={this.onShowModal}>
                <div className="spot-header">
                  <div className="body18-bold">{spot.name}</div>
                  <div className="body14">{spot.description.substr(0, 70) + '...'}</div>
                </div>
              </div>
              )}

              {spot.status === 'активная' && spot.signed_in && (
              <div className="spot-report" onClick={() => onShowReportModal(spot.id)}>
                <div className="body14">Сообщить о статусе</div>
              </div>
              )}
            </div>

            <div className="spot-buttons">
              {spot.manage ? (
                <div className="spot-delete" onClick={() => onDelete(spot.id)}>
                  <div className="body14">Удалить точку</div>
                </div>
              ) : (
                ''
              )}
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
