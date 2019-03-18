import "bootstrap";
import { activeButtons } from '../components/radio_buttons';
import { chatController } from '../components/chat';
// import { addMessage, refreshForm  } from '../components/chat';
activeButtons();
// addMessage(reviewHTML);
// refreshForm(innerHTML);

global.chatController = chatController;
