import React, { Component } from 'react';
import SpotItem from './SpotItem';

class SpotList extends React.Component {
  state = { spots: [] };

  componentDidMount() {
    fetch(`/spots.json?route_id=${this.props.routeId}`)
      .then((response) => response.json())
      .then((data) => {
        this.setState({ spots: data });
      })
      .catch((error) => console.log('error', error));
  }

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
            spots.push(object);
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
              />
            );
          })}
      </div>
    );
  }
}

export default SpotList;
