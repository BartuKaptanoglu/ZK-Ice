"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
require("@nomicfoundation/hardhat-toolbox");
const config = {
    solidity: "0.8.19",
    networks: {
        scrollSepolia: {
            url: "https://sepolia-rpc.scroll.io/" || "",
            accounts: process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
        },
    },
    etherscan: {
        apiKey: {
            scrollSepolia: 'abc',
        },
        customChains: [
            {
                network: 'scrollSepolia',
                chainId: 534351,
                urls: {
                    apiURL: 'https://sepolia-blockscout.scroll.io/api',
                    browserURL: 'https://sepolia-blockscout.scroll.io/',
                },
            },
        ],
    },
};
exports.default = config;
