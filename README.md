# Toggle-level Handshake

<br>The following is a toggle-level handshake protocol which is used to transmit data safely across clock domains.<br />
![image](https://user-images.githubusercontent.com/30327564/207420060-4d6913ec-c797-4edf-8612-0dcf48dbc16e.png)
<br>This design was created based on the circuit described in the paper below.<br />
http://www.gstitt.ece.ufl.edu/courses/eel4720_5721/lectures/metastability/276202.pdf

<br>Below is a waveform of the provided testbench. In this simple testbench we send the current transfer number as the data we wish to cross clock domains.<br />
![image](https://user-images.githubusercontent.com/30327564/207421357-01d4a4bc-b5be-43e9-a88b-9765a5e54e42.png)

<br>The following is based on the waveform given in the previous paper. I extended it out to three transfers to show that the protocol uses toggle level rather than logic level as a means of synchronization.<br />
![image](https://user-images.githubusercontent.com/30327564/207425691-566908f0-ecc0-4579-80ba-a2d0df85b4a2.png)

![image](https://user-images.githubusercontent.com/30327564/207424070-8606abf3-5eac-427e-a620-f5cabb9b607e.png)



