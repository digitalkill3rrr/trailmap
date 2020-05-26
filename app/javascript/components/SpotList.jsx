import React, { Component } from 'react';
import SpotItem from './SpotItem';
import ReportModalForm from './ReportModalForm';

class SpotList extends React.Component {
  state = { spots: [], showReportModal: false, reportSpotId: null };

  componentDidMount() {
    fetch(`/spots.json?route_id=${this.props.routeId}`)
      .then((response) => response.json())
      .then((data) => {
        this.setState({ spots: data });
      })
      .catch((error) => console.log('error', error));
  }

  onShowReportModal = (id) => {
    this.setState({ showReportModal: true });
    this.setState({ reportSpotId: id });
  };

  onHideReportModal = () => {
    this.setState({ showReportModal: false });
  };

  getCsrf = () => {
    return document.querySelector("meta[name='csrf-token']").getAttribute('content');
  };

  handleSubmit = (spotFormData) => {
    const id = spotFormData.get('spot[id]');
    const path = id ? `/spots/${id}.json` : '/spots.json';
    const method = id ? 'PATCH' : 'POST';

    return fetch(path, {
      method: method,
      body: spotFormData,
      headers: {
        'X-CSRF-Token': this.getCsrf(),
      },
    })
      .then((response) => response.json())
      .then((object) => {
        if (Object.keys(object.errors).length === 0) {
          const spots = [...this.state.spots];
          const index = spots.findIndex((spot) => spot.id === object.id);
          if (index === -1) {
            spots.splice(spots.length - 1, 0, object);
          } else {
            spots[index] = object;
          }
          this.setState({ spots });
        }

        return { ...object.errors };
      })
      .catch((error) => console.log('error', error));
  };

  handleDelete = (id) => {
    return fetch(`/spots/${id}.json`, {
      method: 'DELETE',
      headers: {
        'X-CSRF-Token': this.getCsrf(),
      },
    })
      .then(() => {
        const spots = [...this.state.spots.filter((spot) => spot.id !== id)];

        this.setState({ spots });
      })
      .catch((error) => console.log('error', error));
  };

  handleReportSubmit = (report) => {
    return fetch('/reports.json', {
      method: 'POST',
      body: JSON.stringify({ report }),
      headers: {
        'X-CSRF-Token': this.getCsrf(),
        'Content-Type': 'application/json',
      },
    })
      .then((response) => response.json())
      .then((object) => {
        const spots = [...this.state.spots];
        const index = spots.findIndex((spot) => spot.id === object.id);
        spots[index] = object;

        this.setState({ spots });
      })
      .catch((error) => console.log('error', error));
  };

  render() {
    const { spots } = this.state;

    return (
      <div className="spots-container">
        {spots.length > 0 &&
          spots.map((spot) => {
            return (
              <SpotItem
                key={spot.id || 'newSpot'}
                spot={spot}
                onSubmit={this.handleSubmit}
                onDelete={this.handleDelete}
                onShowReportModal={this.onShowReportModal}
              />
            );
          })}
        <ReportModalForm
          show={this.state.showReportModal}
          handleClose={this.onHideReportModal}
          onSubmit={this.handleReportSubmit}
          reportSpotId={this.state.reportSpotId}
        ></ReportModalForm>
      </div>
    );
  }
}

export default SpotList;
