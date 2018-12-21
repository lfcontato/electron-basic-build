const { app, BrowserWindow } = require('electron');
var path = require('path');
var url = require('url');

app.on('ready', () => {
  
  mainWindow = new BrowserWindow({ width:800, height:600 });
  mainWindow.webContents.openDevTools();
  mainWindow.loadURL ( path.join(__dirname, 'index.html') );
  
});


