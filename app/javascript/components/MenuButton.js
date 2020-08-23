import React from "react"
import PropTypes from "prop-types"
import {CSSTransition} from 'react-transition-group';
import Icon from '../../assets/images/batu.png'

function Humberger(props) {
    return (
      <div id="humberger" onClick={() => props.onSetSidebarOpen(true)}>
        <div></div>
        <div></div>
        <div></div>
      </div>
    );
  }

function Sidebar(props){
  return(
    <div>
      <div id ="sidebar">
        <div className ="batu" onClick={() => props.onSetSidebarOpen(false)} >
          <p>×</p>
        </div>
        <div href = "#" className ="login-responsive-btn">
          <a>ログイン</a>
        </div>
        <div href ="#"className ="signup-responsive-btn">
          <a>サインアップ</a>
        </div>
      </div>
      <div id = "alltouch" onClick={() => props.onSetSidebarOpen(false)}>
      </div>
    </div>
  );
}

class MenuButton extends React.Component {
   constructor(props) {
      super(props);
      this.state = {
        sidebarOpen: false
      };
      this.onSetSidebarOpen = this.onSetSidebarOpen.bind(this);
    }

    onSetSidebarOpen(open) {
      this.setState({ sidebarOpen: open });
    }

    render() {
      if(this.state.sidebarOpen==true){
        return (
          <React.Fragment>
            <Sidebar
             onSetSidebarOpen={this.onSetSidebarOpen}
            />
          </React.Fragment>
        );
      } else {
        return (
          <React.Fragment>
            <Humberger
             onSetSidebarOpen={this.onSetSidebarOpen}
            />
          </React.Fragment>
        );
      }
   }
}

export default MenuButton
