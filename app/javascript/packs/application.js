import "bootstrap";
import { activeButtons } from '../components/radio_buttons';
import { showDropdown } from '../components/dropdown';
import { chatController } from '../components/chat';

activeButtons();

showDropdown();

global.chatController = chatController;
