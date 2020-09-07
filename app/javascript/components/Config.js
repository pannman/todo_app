import React from "react"
import PropTypes from "prop-types"
import {CSSTransition} from 'react-transition-group';
import Icon from '../../assets/images/configuration.png'

function Configuration(props) {
    return (
      <div className="configuration-image" onClick={() => props.onConfigOpen(true)}>
        <img src={Icon} />
      </div>
    );
  }

function Balloon(props){
  return(
    <div>
      <div className="configuration-image" onClick={() => props.onConfigOpen(false)}>
        <img src={Icon} />
      </div>
      <div className="balloon">
        <form  action="/login" method="get">
          <input type="submit" value="ユーザー設定" className ="config-btn" />
        </form>
        <form  action="/logout" method="post">
          <HiddenField value="DELETE" name='_method' />
          <input type="submit" value="ログアウト" className ="logout-btn" />
        </form>
      </div>
      <div id = "alltouch" onClick={() => props.onConfigOpen(false)}>
      </div>
    </div>
  );
}

class Config extends React.Component {
   constructor(props) {
      super(props);
      this.state = {
        configOpen: false
      };
      this.onConfigOpen = this.onConfigOpen.bind(this);
    }

    onConfigOpen(open) {
      this.setState({ configOpen: open });
    }

    render() {
      if(this.state.configOpen==true){
        return (
          <React.Fragment>
            <Balloon
             onConfigOpen={this.onConfigOpen}
            />
          </React.Fragment>
        );
      } else {
        return (
          <React.Fragment>
            <Configuration
             onConfigOpen={this.onConfigOpen}
            />
          </React.Fragment>
        );
      }
   }
}

export default Config
