import React, { Component } from 'react';

class ReportModalForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = this.emptyState();
  }

  resetForm = () => {
    this.setState(this.emptyState());
  };

  emptyState = () => {
    return {
      body: '',
      spot_id: '',
    };
  };

  handleChange = (event) => {
    const { target } = event;

    this.setState({ [target.name]: target.value });
  };

  handleSubmit = (event) => {
    event.preventDefault();

    const { onSubmit, handleClose, reportSpotId } = this.props;

    this.setState(
      {
        spot_id: reportSpotId,
      },
      () => {
        onSubmit(this.state);
        handleClose();
        this.resetForm();
      },
    );
  };

  handleCloseForm = () => {
    this.props.handleClose();
    this.resetForm();
  };

  render() {
    const { show } = this.props;
    const showHideClassName = show ? 'backdrop display-block' : 'backdrop display-none';

    return (
      <div className={showHideClassName}>
        <div className="report-modal">
          <div className="report-modal-header">
            <span className="close-btn" onClick={this.handleCloseForm}>
              &times;
            </span>
            <h4>Сообщить о проблеме</h4>
          </div>
          <div className="report-modal-content">
        <div className="modal">
          <div className="modal-header">
            <span className="close-btn" onClick={this.handleCloseForm}>
              &times;
            </span>
            <h4>Сообщить о статусе</h4>
          </div>
          <div className="modal-content">
            <form onSubmit={this.handleSubmit}>
              <div>
                <textarea
                  rows="5"
                  cols="50"
                  name="body"
                  value={this.state.body}
                  onChange={this.handleChange}
                />
              </div>

              <div className="report-modal-buttons">
                <button type="submit" disabled={this.state.body.length === 0}>
                  <div className="body16-bold">Сохранить</div>
                </button>
                <button type="button" onClick={this.handleCloseForm}>
                  <div className="body16-bold">Отменить</div>
              <div className="modal-buttons">
                <button type="submit" disabled={this.state.body.length === 0}>
                  Сохранить
                </button>
                <button type="button" onClick={this.handleCloseForm}>
                  Отмена
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    );
  }
}

export default ReportModalForm;
