import React, { Component } from 'react';

class SpotModalForm extends React.Component {
  constructor(props) {
    super(props);

    const { spot } = props;
    this.state = {
      id: spot.id || '',
      name: spot.name || '',
      status: spot.status || spot.status_options[0],
      description: spot.description || '',
      longitude: spot.longitude || '',
      latitude: spot.latitude || '',
      tag_list: spot.tag_list.join(' '),
      imagesForUpload: [],
      imagesToDelete: [],
      fileName: '',
      errors: {},
    };
  }

  resetForm = () => {
    const { spot } = this.props;

    this.setState({
      id: spot.id || '',
      name: spot.name || '',
      status: spot.status || '',
      description: spot.description || '',
      longitude: spot.longitude || '',
      latitude: spot.latitude || '',
      tag_list: spot.tag_list.join(' '),
      imagesForUpload: [],
      imagesToDelete: [],
      fileName: '',
      errors: {},
    });
  };

  handleChange = (event) => {
    const { target } = event;

    this.setState({ [target.name]: target.value });
  };

  handleFileChange = (event) => {
    const { target } = event;
    const files = Array.from(target.files);

    this.setState({ imagesForUpload: files, fileName: target.value });
  };

  handleImageDeleteChange = (event) => {
    const { target } = event;
    let imagesIds = [...this.state.imagesToDelete];

    if (target.checked) {
      imagesIds.push(target.value);
    } else {
      imagesIds = imagesIds.filter((id) => id !== target.value);
    }

    this.setState({ imagesToDelete: imagesIds });
  };

  buildForm = (spot) => {
    const formData = new FormData();

    formData.append('spot[id]', spot.id);
    formData.append('spot[name]', spot.name);
    formData.append('spot[status]', spot.status);
    formData.append('spot[description]', spot.description);
    formData.append('spot[longitude]', spot.longitude);
    formData.append('spot[latitude]', spot.latitude);
    formData.append('spot[tag_list]', spot.tag_list);

    spot.imagesForUpload.forEach((file, index) => {
      formData.append(`spot[spot_images_attributes][${index}][image]`, file);
    });

    const uploadedCount = spot.imagesForUpload.length;
    spot.imagesToDelete.forEach((id, index) => {
      formData.append(`spot[spot_images_attributes][${index + uploadedCount}][id]`, id);
      formData.append(`spot[spot_images_attributes][${index + uploadedCount}][_destroy]`, true);
    });

    if (!spot.id) {
      formData.append('spot[route_id]', this.props.spot.route_id);
    }

    return formData;
  };

  handleSubmit = (event) => {
    event.preventDefault();

    const { onSubmit, handleClose } = this.props;
    const spot = { ...this.state };

    onSubmit(this.buildForm(spot)).then((errors) => {
      if (Object.keys(errors).length === 0) {
        handleClose();
        this.resetForm();
      } else {
        this.setState({ errors });
      }
    });
  };

  handleCloseForm = () => {
    this.props.handleClose();
    this.resetForm();
  };

  validate = (fieldName) => {
    const { errors } = this.state;

    return errors[fieldName] ? 'error' : '';
  };

  render() {
    const { show, spot } = this.props;
    const { errors } = this.state;
    const showHideClassName = show ? 'backdrop display-block' : 'backdrop display-none';

    return (
      <div className={showHideClassName}>
        <div className="modal">
          <div className="modal-header">
            <span className="close-btn" onClick={this.handleCloseForm}>
              &times;
            </span>
            <h4>{spot.id ? `Редактировать ${spot.name}` : 'Создать точку'}</h4>
          </div>
          <div className="modal-content">
            <form onSubmit={this.handleSubmit}>
              <div>
                <label className={this.validate('name')}>Название</label>
                <input
                  className={this.validate('name')}
                  type="text"
                  name="name"
                  value={this.state.name}
                  onChange={this.handleChange}
                />
                {errors.name && <div className="error">{errors.name}</div>}
              </div>

              <div>
                <select name="status" value={this.state.status} onChange={this.handleChange}>
                  {spot.status_options.map((option, index) => {
                    return (
                      <option key={index} value={option}>
                        {option}
                      </option>
                    );
                  })}
                </select>
              </div>

              <div>
                <label>Описание</label>
                <textarea
                  rows="5"
                  cols="50"
                  name="description"
                  value={this.state.description}
                  onChange={this.handleChange}
                />
              </div>

              <div>
                <label className={this.validate('longitude')}>Долгота</label>
                <input
                  className={this.validate('longitude')}
                  type="text"
                  name="longitude"
                  value={this.state.longitude}
                  onChange={this.handleChange}
                />
                {errors.longitude && <div className="error">{errors.longitude}</div>}
              </div>

              <div>
                <label className={this.validate('latitude')}>Широта</label>
                <input
                  className={this.validate('latitude')}
                  type="text"
                  name="latitude"
                  value={this.state.latitude}
                  onChange={this.handleChange}
                />
                {errors.latitude && <div className="error">{errors.latitude}</div>}
              </div>

              <div>
                <label className={this.validate('tag_list')}>Теги</label>
                <input
                  className={this.validate('tag_list')}
                  type="text"
                  name="tag_list"
                  value={this.state.tag_list}
                  onChange={this.handleChange}
                />
                {errors.tag_list && <div className="error">{errors.tag_list}</div>}
              </div>

              <div>
                {spot.images.map((image, index) => {
                  return (
                    <div key={image.id} className="images-wrapper">
                      <img className="spot-image" src={image.src} />
                      <div className="checkbox">
                        <input
                          type="checkbox"
                          name="imagesToDelete"
                          value={image.id}
                          onChange={this.handleImageDeleteChange}
                        />
                        <label>Удалить фото</label>
                      </div>
                    </div>
                  );
                })}
              </div>

              <div>
                <label>Добавить фото</label>
                <input
                  multiple="multiple"
                  name="images"
                  type="file"
                  value={this.state.fileName}
                  onChange={this.handleFileChange}
                />
              </div>

              <div className="modal-buttons">
                <button type="submit">Сохранить</button>
                <button type="button" onClick={this.handleCloseForm}>
                  Отмена
                </button>
              </div>
            </form>
            <div>Создал: {spot.user}</div>
          </div>
        </div>
      </div>
    );
  }
}

export default SpotModalForm;
