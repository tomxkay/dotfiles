#!/bin/bash
echo $STR$( whatis $(ls /bin | shuf | head -1)) | cowsay
