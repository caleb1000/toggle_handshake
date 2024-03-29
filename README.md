# Toggle-level Handshake

<br>Metastability is a phenomenon that electrical circuits can exhibit, and which causes the output to be unpredictable. This can occur for many different reason but is commonly caused when crossing clock domains without proper synchronization. Without synchronization, the setup and hold times of registers can be violated resulting in metastable values. Crossing clock domains is sometimes unavoidable when multiple devices in a design utilize different clock frequencies. While dual-flop synchronizers work for single bits, to reliably transfer larger data sizes a more sophisticated approach must be used. The following is an example of a dual-flop being used to synchronize one bit across clock domains. https://en.wikipedia.org/wiki/Metastability_%28electronics%29 <br/>
![image](https://user-images.githubusercontent.com/30327564/207465174-ab7f08d2-ad39-42b1-97c8-b722c975471e.png)
<br>The following is a toggle-level handshake protocol which is used to transmit multiple bits of data safely across clock domains. By basing the design to work around the change of the previous state (toggle) the handshake protocol does not need to waste time resetting the logic level. The image below shows the circuit being split up between the source and destination clock domains. This is done to emphasis the used of two separate clocks. Do note, in the provided test bench one clock is utilized, though this protocol should work for any clock frequency relationship.<br />
![image](https://user-images.githubusercontent.com/30327564/207420060-4d6913ec-c797-4edf-8612-0dcf48dbc16e.png)
<br>This design was created based on the circuit described in the paper below.<br />
[http://www.gstitt.ece.ufl.edu/courses/eel4720_5721/lectures/metastability/276202.pdf](http://www.gstitt.ece.ufl.edu/courses/fall21/eel4720_5721/lectures/metastability/276202.pdf)

<br>Below is a waveform of the provided testbench. In this simple testbench we send the current transfer number as the data we wish to cross clock domains.<br />
![image](https://user-images.githubusercontent.com/30327564/207421357-01d4a4bc-b5be-43e9-a88b-9765a5e54e42.png)

<br>The following is based on the waveform given in the previous paper. I extended it out to three transfers to show that the protocol uses toggle level rather than logic level as a means of synchronization.<br />
![image](https://user-images.githubusercontent.com/30327564/207425691-566908f0-ecc0-4579-80ba-a2d0df85b4a2.png)
<br>Below shows a waveform of the circuit utilizing the testbench which matches the waveform provided in the paper.<br/>
![image](https://user-images.githubusercontent.com/30327564/207424070-8606abf3-5eac-427e-a620-f5cabb9b607e.png)



