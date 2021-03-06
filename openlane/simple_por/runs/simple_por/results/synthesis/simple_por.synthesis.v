/* Generated by Yosys 0.9+3621 (git sha1 84e9fa7, gcc 8.3.1 -fPIC -Os) */

module simple_por(vdd3v3, vss, porb_h);
  wire _0_;
  wire mid;
  output porb_h;
  input vdd3v3;
  input vss;
  sky130_fd_sc_hvl__conb_1 _1_ (
    .LO(_0_)
  );
  sky130_fd_sc_hvl__schmittbuf_1 hystbuf1 (
    .A(_0_),
    .X(mid)
  );
  sky130_fd_sc_hvl__schmittbuf_1 hystbuf2 (
    .A(mid),
    .X(porb_h)
  );
endmodule
