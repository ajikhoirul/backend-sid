import Video from "../models/VideoModel.js";
import path from "path";

export const getVideo = async (req, res) => {
  try {
    const response = await Video.findAll();
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

export const getVideoById = async (req, res) => {
  try {
    const response = await Video.findOne({
      where: {
        id_video: req.params.id,
      },
    });
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

export const saveVideo = async (req, res) => {
  const { judul, url, sumber } = req.body;
  try {
    await Video.create({
      judul: judul,
      url: url,
      sumber: sumber,
    });
    res.status(201).json({ msg: "Video berhasil ditambahkan" });
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};
export const updateVideo = async (req, res) => {
  const video = await Video.findOne({
    where: {
      id_video: req.params.id,
    },
  });
  if (!video) return res.status(404).json({ msg: "Video tidak ditemukan" });
  const { judul, url, sumber } = req.body;
  try {
    await Video.update(
      {
        judul: judul,
        url: url,
        sumber: sumber,
      },
      {
        where: {
          id: video.id,
        },
      }
    );
    res.status(200).json({ msg: "Video berhasil diupdate" });
  } catch (error) {
    res.status(400).json({ msg: error.message });
  }
};
