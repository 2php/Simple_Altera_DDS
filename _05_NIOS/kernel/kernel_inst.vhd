	component kernel is
		port (
			clk_clk            : in  std_logic                     := 'X'; -- clk
			pio_nco_phi_export : out std_logic_vector(31 downto 0);        -- export
			reset_reset_n      : in  std_logic                     := 'X'  -- reset_n
		);
	end component kernel;

	u0 : component kernel
		port map (
			clk_clk            => CONNECTED_TO_clk_clk,            --         clk.clk
			pio_nco_phi_export => CONNECTED_TO_pio_nco_phi_export, -- pio_nco_phi.export
			reset_reset_n      => CONNECTED_TO_reset_reset_n       --       reset.reset_n
		);

